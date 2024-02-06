
package com.codebook.admin;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hashing {
     public static String[] methodHashing(String[] originalData) throws NoSuchAlgorithmException {
        String[] hashedDataArray = new String[originalData.length];

        for (int i = 0; i < originalData.length; i++) {
            String currentData = originalData[i];

            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = digest.digest(currentData.getBytes());

            // Convert the byte array to a hex string
            StringBuilder hexString = new StringBuilder();
            for (byte hashedByte : hashedBytes) {
                String hex = Integer.toHexString(0xff & hashedByte);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }

            hashedDataArray[i] = hexString.toString();
        }

        return hashedDataArray;
    }
}
