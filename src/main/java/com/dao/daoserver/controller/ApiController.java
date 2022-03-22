package com.dao.daoserver.controller;

import com.dao.daoserver.entity.TAd;
import com.dao.daoserver.mapper.TAdMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.ECKeyPair;
import org.web3j.crypto.RawTransaction;
import org.web3j.crypto.TransactionEncoder;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameterName;
import org.web3j.protocol.core.methods.response.EthGetTransactionCount;
import org.web3j.protocol.core.methods.response.EthSendTransaction;
import org.web3j.protocol.http.HttpService;
import org.web3j.tx.ChainId;
import org.web3j.utils.Convert;
import org.web3j.utils.Numeric;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;

@RestController
@CrossOrigin(origins = "*",maxAge = 3600)
public class ApiController {
    @Autowired
    TAdMapper tAdMapper;

    private static Web3j web3j;
    private static String address = "0x136AC9C25F4E16Acf12D3E613371078AEf11c4aE";
    private static String privateKey1 = "c62b1a019995284f1fa113df55823ea129afc777d00308924b6ae6f61e7acc73";

    static {
        web3j = Web3j.build(new HttpService("https://ropsten.infura.io/v3/9676a35d629d488fb90d7eac1348c838"));
    }

    @RequestMapping("/Transact")
    public String tranTo(String _to)
    {
        EthGetTransactionCount ethGetTransactionCount = null;
        try {
            ethGetTransactionCount = web3j.ethGetTransactionCount(address, DefaultBlockParameterName.PENDING).send();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (ethGetTransactionCount == null) return "adress error!";

        BigInteger nonce = ethGetTransactionCount.getTransactionCount();
        BigInteger gasPrice = Convert.toWei(BigDecimal.valueOf(3), Convert.Unit.GWEI).toBigInteger();
        BigInteger gasLimit = BigInteger.valueOf(30000);
        String to =_to.toLowerCase();
        TAd _tad=tAdMapper.selectById(to);
        if(_tad!=null) return "The adress "+to+" is already get!";
        BigInteger value = Convert.toWei(BigDecimal.valueOf(0.3), Convert.Unit.ETHER).toBigInteger();
        String data = "";
        byte chainId = ChainId.ROPSTEN;//测试网络
        String privateKey =privateKey1;
        String signedData;
        try {
            signedData = signTransaction(nonce, gasPrice, gasLimit, to, value, data, chainId, privateKey);
            if (signedData != null) {
                EthSendTransaction ethSendTransaction = web3j.ethSendRawTransaction(signedData).send();
                TAd tAd=new TAd();
                tAd.setId(to);
                tAdMapper.insert(tAd);
                return ethSendTransaction.getTransactionHash();
            } else return "signTransaction error！";
        } catch (IOException e) {
          return   e.getMessage();
        }
    }

    @RequestMapping("/getbalance")
    public BigInteger getbalance()
    {
        try {
            BigInteger balance = web3j.ethGetBalance(address,
                    DefaultBlockParameterName.LATEST).send().getBalance();
          return balance;
        } catch (IOException e) {
          return BigInteger.valueOf(0);
        }
    }
    /**
     * 签名交易
     */
    private   String signTransaction(BigInteger nonce, BigInteger gasPrice, BigInteger gasLimit, String to,
                                   BigInteger value, String data, byte chainId, String privateKey) throws IOException {
        byte[] signedMessage;
        RawTransaction rawTransaction = RawTransaction.createTransaction(
                nonce,
                gasPrice,
                gasLimit,
                to,
                value,
                data);

        if (privateKey.startsWith("0x")) {
            privateKey = privateKey.substring(2);
        }
        ECKeyPair ecKeyPair = ECKeyPair.create(new BigInteger(privateKey, 16));
        Credentials credentials = Credentials.create(ecKeyPair);

        if (chainId > ChainId.NONE) {
            signedMessage = TransactionEncoder.signMessage(rawTransaction, chainId, credentials);
        } else {
            signedMessage = TransactionEncoder.signMessage(rawTransaction, credentials);
        }

        String hexValue = Numeric.toHexString(signedMessage);
        return hexValue;
    }
}
