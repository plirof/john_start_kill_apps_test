//import java.awt.BorderLayout;
import javax.swing.BoxLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.util.concurrent.ExecutionException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;
import javax.swing.SwingWorker;
import javax.swing.UIManager;

public class JavaSchRuntimeExec  implements ActionListener{

    private JButton executeButton,executeButton2,executeButton3,executeButton4,executeButton5;
    private JButton[] buttons ;//= new JButton[10];
    private String[] button_text;

    protected void initUI() {
        final JFrame frame = new JFrame();
        frame.setTitle(JavaSchRuntimeExec.class.getSimpleName());
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(new BoxLayout(frame.getContentPane(), BoxLayout.Y_AXIS));

        executeButton = new JButton("Clik me to execute command");
        executeButton.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                doWork();
            }
        });
        frame.add(executeButton);

        executeButton2 = new JButton("button2 Clik me to execute command");
        executeButton2.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                //ProcessBuilder builder = new ProcessBuilder(System.getProperty("java.home") + "/bin/java", "-version");
                //builder.redirectErrorStream(true);
               try {
                    Process proc = Runtime.getRuntime().exec("./exec_script01.sh");                        
                    //proc.waitFor();                } catch (InterruptedException e) 
                } catch (Exception ex1) {
                    ex1.printStackTrace();
                }
                
                doWork();
            }
        });
        frame.add(executeButton2);



        buttons = new JButton[10];

        buttons[0] = new JButton("0");

        button_text = new String[10];
        button_text[1]="jon_update_init_lessons";
        button_text[2]="jon_update_init_lessons";
        button_text[3]="jon_update_init_lessons";
        button_text[4]="jon_update_init_lessons";
        button_text[5]="jon_update_init_lessons";
        button_text[6]="jon_update_init_lessons";
        button_text[7]="jon_update_init_lessons";
        button_text[8]="jon_update_init_lessons";
        button_text[9]="jon_update_init_lessons";



        // loop
        for(int j=1;j<=9;j++)
            {
                //JButton btn=new JButton(String.valueOf(i));
                //panel.add(btn);
                buttons[j] = new JButton("button"+j);
                buttons[j].addActionListener(this);
                buttons[j].setText(j+" - "+button_text[j]);

                frame.add(buttons[j]);
                System.out.println(buttons[j].getText());
            }//end of for(int j=1;j<=9;j++)





        frame.pack();
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);


    }

    public void actionPerformed(ActionEvent evt) {
       Object src = evt.getSource();
       //int j=1;
       System.out.println("110+++++++++++PRESSED :");
       for(int i=1;i<=9;i++)
            {
                System.out.println("113+++++++++++PRESSED:");
            if (src == this.buttons[i]) {
                System.out.println("115+++++++++++PRESSED:");
                String s= "./exec_script0"+i+".sh"; 

                 System.out.println("117---------------PRESSED:"+buttons[i].getText());
            //First button actions
                try {
                    Process proc = Runtime.getRuntime().exec(s);                        
                } catch (Exception ex1) {
                    ex1.printStackTrace();
                }
            }//end of if (src == buttons[i]) {
        }//end of for(int i=1;i<=9;j++)

    }


    protected void doWork() {
        SwingWorker<String, Void> worker = new SwingWorker<String, Void>() {
            @Override
            protected String doInBackground() throws Exception {
                ProcessBuilder builder = new ProcessBuilder(System.getProperty("java.home") + "/bin/java", "-version");
                builder.redirectErrorStream(true);
                Process process = builder.start();
                ConsoleReader consoleReader = new ConsoleReader(process.getInputStream());
                consoleReader.start();
                int waitFor = process.waitFor();
                consoleReader.join();
                switch (waitFor) {
                case 0:
                    return consoleReader.getResult();
                default:
                    throw new RuntimeException("Failed to execute " + builder.command() + " \nReturned message: "
                            + consoleReader.getResult());
                }
            }

            @Override
            protected void done() {
                try {
                    showCommandResult(get());
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } catch (ExecutionException e) {
                    e.printStackTrace();
                    showCommandError(e);
                }
            }
        };
        worker.execute();
    }

    protected void showCommandError(ExecutionException e) {
        JOptionPane.showMessageDialog(executeButton, e.getMessage(), "An error has occured", JOptionPane.ERROR_MESSAGE);
    }

    protected void showCommandResult(String commandResult) {
        JOptionPane.showMessageDialog(executeButton, commandResult);
    }

    public static void main(String[] args) {
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new JavaSchRuntimeExec().initUI();
            }
        });
    }

    public static class ConsoleReader extends Thread {
        private InputStream is;

        private StringWriter sw;

        ConsoleReader(InputStream is) {
            this.is = is;
            sw = new StringWriter();
        }

        @Override
        public void run() {
            try {
                int c;
                while ((c = is.read()) != -1) {
                    sw.write(c);
                }
            } catch (IOException e) {
                ;
            }
        }

        String getResult() {
            return sw.toString();
        }
    }
}