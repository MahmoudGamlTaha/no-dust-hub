package com.jwt.EncDecPackage;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class EncryptDecryptClass {
   /* public  String encrypt(String strClearText,String strKey) throws Exception{
        String strData="";
        System.out.println("strClearText: "+strClearText);
        try {
                SecretKeySpec skeyspec=new SecretKeySpec(strKey.getBytes(),"AES");
                Cipher cipher=Cipher.getInstance("AES");
                cipher.init(Cipher.ENCRYPT_MODE, skeyspec);
                byte[] encrypted=cipher.doFinal(strClearText.getBytes());
                strData=new String(encrypted);
                
        } catch (Exception e) {
                e.printStackTrace();
                throw new Exception(e);
        }
        System.out.println("strData: "+strData);
        return strData;
}

public  String decrypt(String strEncrypted,String strKey) throws Exception{
        String strData="";
        //strEncrypted="KAmal ashraf kamal ";
        System.out.println("strEncrypted: "+strEncrypted);
        try {
                SecretKeySpec skeyspec=new SecretKeySpec(strKey.getBytes(),"AES");
                Cipher cipher=Cipher.getInstance("AES");
                cipher.init(Cipher.DECRYPT_MODE, skeyspec);
               // byte[] encValue = c.doFinal(valueToEnc.getBytes("UTF8"));
                byte[] decrypted=cipher.doFinal(strEncrypted.getBytes("UTF8"));
                strData=new String(decrypted);
                
        } catch (Exception e) {
                e.printStackTrace();
                throw new Exception(e);
        }
        return strData;
}*/
	private  SecretKeySpec secretKey;
    private  byte[] key;
 
    public  void setKey(String myKey)
    {
        MessageDigest sha = null;
        try {
            key = myKey.getBytes("UTF-8");
            sha = MessageDigest.getInstance("SHA-1");
            key = sha.digest(key);
            key = Arrays.copyOf(key, 16);
            secretKey = new SecretKeySpec(key, "AES");
        }
        catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
 
    public  String encrypt(String strToEncrypt, String secret)
    {
        try
        {
            setKey(secret);
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            return Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
        }
        catch (Exception e)
        {
            System.out.println("Error while encrypting: " + e.toString());
        }
        return null;
    }
 
    public  String decrypt(String strToDecrypt, String secret)
    {
        try
        {
            setKey(secret);
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            return new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
        }
        catch (Exception e)
        {
            System.out.println("Error while decrypting: " + e.toString());
        }
        return null;
    }
}
