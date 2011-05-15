import java.util.*;

import org.mortbay.jetty.*;
import org.mortbay.jetty.bio.*;
import org.mortbay.jetty.handler.*;
import org.mortbay.jetty.servlet.*;

public class WebServer {
    public static void main(String[] args) throws Exception {
        List<String> addresses = new ArrayList<String>();
        
        // parse any IP addresses to start up on
        if (args.length > 0 && args[0].equals("-h")) {
            for (int i = 1; i < args.length; i++) {
                addresses.add(args[i]);
            }
        } else {
            addresses.add("127.0.0.1");
        }
        
        System.out.print("Starting web server on port 8080 on ");
        for (int i = 0; i < addresses.size(); i++) {
            System.out.print(addresses.get(i));
            if (i != (addresses.size() - 1)) {
                System.out.print(", ");
            }
        }
        System.out.println();

        // start up our server
        Server server = new Server();
        
        // start up a Jetty connector on each given IP address
        Connector[] connectors = new Connector[addresses.size()];
        for (int i = 0; i < addresses.size(); i++) {
            connectors[i] = new SocketConnector();
            connectors[i].setHost(addresses.get(i));
            connectors[i].setPort(8080);
        }
        server.setConnectors(connectors);
        
        Context context = new Context(server, "/", Context.SESSIONS);        
        ServletHolder holder = context.addServlet(DefaultServlet.class, "/*");
        holder.setInitParameter("resourceBase", ".");
        holder.setInitParameter("dirAllowed", "true");
        holder.setInitParameter("redirectWelcome", "false");
        holder.setInitParameter("gzip", "true");
        
        server.start();
        server.join();
    }
}