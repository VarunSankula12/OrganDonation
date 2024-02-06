package com.codebook.admin;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Block {
    private String myData;
    private String previousHash;
    private String hash;

    public Block(String myData, String previousHash) {
        this.myData = myData;
        this.previousHash = previousHash;
        this.hash = calculateHash();
    }

    public String getMyData() {
        return myData;
    }

    public String getPreviousHash() {
        return previousHash;
    }

    public String getHash() {
        return hash;
    }

    public String calculateHash() {
        String dataToHash = myData + previousHash;
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = digest.digest(dataToHash.getBytes());
            StringBuilder hashStringBuilder = new StringBuilder();
            for (byte hashByte : hashBytes) {
                hashStringBuilder.append(String.format("%02x", hashByte));
            }
            return hashStringBuilder.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    
    public String calculateHashForField(String fieldValue) {
        String dataToHash = fieldValue + previousHash;
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = digest.digest(dataToHash.getBytes());
            StringBuilder hashStringBuilder = new StringBuilder();
            for (byte hashByte : hashBytes) {
                hashStringBuilder.append(String.format("%02x", hashByte));
            }
            return hashStringBuilder.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
