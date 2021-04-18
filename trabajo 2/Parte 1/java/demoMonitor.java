package demo;

import java.util.*;

import multichain.command.*;
import multichain.object.*;

public class Demo {
    public static void main(String[] args) {
        CommandManager commandManager = new CommandManager(
            "localhost",
            "7174",
            "multichainrpc",
            "7nbmu9KPZaRdmUntRAv9gwPKGih4xiWFuyq3MozLQzMF"
        );
        
        List<StreamKeyItem> items;
        try {
            commandManager.invoke(CommandElt.SUBSCRIBE, "stream1");
            items = (List<StreamKeyItem>)commandManager.invoke(CommandElt.LISTSTREAMKEYITEMS, "stream1", "key1");
            for (StreamKeyItem item : items) {
                System.out.println(item);
            }
        } catch (MultichainException e) {
            e.printStackTrace();
        }
    }
}