package com.codebook.admin;

import java.util.ArrayList;
import java.util.List;

public class Blockchain {
    private List<Block> blocks;

    public Blockchain() {
        this.blocks = new ArrayList<>();
        // Add a genesis block or any initialization logic if needed
    }

    public void addBlock(String myData) {
        String previousHash = blocks.isEmpty() ? "0" : blocks.get(blocks.size() - 1).getHash();

        Block newBlock = new Block(myData, previousHash);
        blocks.add(newBlock);
    }

    public List<Block> getBlocks() {
        return blocks;
    }

    public Block getLatestBlock() {
        if (!blocks.isEmpty()) {
            return blocks.get(blocks.size() - 1);
        }
        return null;
    }

    public boolean isValid() {
        for (int i = 1; i < blocks.size(); i++) {
            Block currentBlock = blocks.get(i);
            Block previousBlock = blocks.get(i - 1);

            if (!currentBlock.getHash().equals(currentBlock.calculateHash())) {
                System.out.println("Block #" + i + " has been tampered.");
                return false;
            }

            if (!currentBlock.getPreviousHash().equals(previousBlock.getHash())) {
                System.out.println("Block #" + i + " has invalid previous hash.");
                return false;
            }
        }
        return true;
    }
}
