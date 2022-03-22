package com.dao.daoserver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.ECKeyPair;
import org.web3j.crypto.RawTransaction;
import org.web3j.crypto.TransactionEncoder;
import org.web3j.tx.ChainId;
import org.web3j.utils.Numeric;

import java.io.IOException;
import java.math.BigInteger;

@Controller
public class WebController {

    @RequestMapping("/")
    String getMain()
    {
        return "main";
    }


}
