package com.Class;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {

    public static boolean deleteFile(String Path) {
        boolean f = false;

        try {
            File file = new File(Path);
            f = file.delete();
        } catch (Exception e) {
            System.out.println("deleteFile() : Error ==> " + e.getMessage());
        }

        return f;
    }

    public static boolean saveFile(InputStream is, String Path) {
        boolean f = false;

        try {

            byte buffer[] = new byte[is.available()];
            is.read(buffer); // is na data read karse ane byte ma muki dese

//            Data Write karva mate
            File targetFile = new File(Path);
            try (FileOutputStream fos = new FileOutputStream(Path)) {
                fos.write(buffer);
                fos.flush();
//                fos.close();
                f = true;
            }

        } catch (Exception e) {
            System.out.println("saveFile() : error ==> " + e.getMessage());
        }

        return f;
    }
}
