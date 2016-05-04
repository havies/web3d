package com.boidea.framework.core.net.examples;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import com.boidea.framework.core.net.io.Util;

/***
 * This is a utility class providing a reader/writer capability required
 * by the weatherTelnet, rexec, rshell, and rlogin example programs.
 * The only point of the class is to hold the static method readWrite
 * which spawns a reader thread and a writer thread.  The reader thread
 * reads from a local input source (presumably stdin) and writes the
 * data to a remote output destination.  The writer thread reads from
 * a remote input source and writes to a local output destination.
 * The threads terminate when the remote input source closes.
 * <p>
 ***/

public final class IOUtil
{

    public static final void readWrite(final InputStream remoteInput,
                                       final OutputStream remoteOutput,
                                       final InputStream localInput,
                                       final OutputStream localOutput)
    {
        Thread reader, writer;

        reader = new Thread()
                 {
                     public void run()
                     {
                         int ch;

                         try
                         {
                             while (!interrupted() && (ch = localInput.read()) != -1)
                             {
                                 remoteOutput.write(ch);
                                 remoteOutput.flush();
                             }
                         }
                         catch (IOException e)
                         {
                             //e.printStackTrace();
                         }
                     }
                 }
                 ;


        writer = new Thread()
                 {
                     public void run()
                     {
                         try
                         {
                             Util.copyStream(remoteInput, localOutput);
                         }
                         catch (IOException e)
                         {
                             e.printStackTrace();
                             System.exit(1);
                         }
                     }
                 };


        writer.setPriority(Thread.currentThread().getPriority() + 1);

        writer.start();
        reader.setDaemon(true);
        reader.start();

        try
        {
            writer.join();
            reader.interrupt();
        }
        catch (InterruptedException e)
        {
        }
    }

}
