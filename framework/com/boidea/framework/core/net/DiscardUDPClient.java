package com.boidea.framework.core.net;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.InetAddress;

/***
 * The DiscardUDPClient class is a UDP implementation of a client for the
 * Discard protocol described in RFC 863. To use the class, just open a local
 * UDP port with {@link org.apache.commons.net.DatagramSocketClient#open open }
 * and call {@link #send send } to send datagrams to the server After you're
 * done sending discard data, call
 * {@link org.apache.commons.net.DatagramSocketClient#close close() } to clean
 * up properly.
 * <p>
 * <p>
 * 
 * @author Daniel F. Savarese
 * @see DiscardTCPClient
 ***/

public class DiscardUDPClient extends DatagramSocketClient {
	/*** The default discard port. It is set to 9 according to RFC 863. ***/
	public static final int DEFAULT_PORT = 9;

	DatagramPacket _sendPacket;

	public DiscardUDPClient() {
		_sendPacket = new DatagramPacket(new byte[0], 0);
	}

	/***
	 * Sends the specified data to the specified server at the specified port.
	 * <p>
	 * 
	 * @param data
	 *            The discard data to send.
	 * @param length
	 *            The length of the data to send. Should be less than or equal
	 *            to the length of the data byte array.
	 * @param host
	 *            The address of the server.
	 * @param port
	 *            The service port.
	 * @exception IOException
	 *                If an error occurs during the datagram send operation.
	 ***/
	public void send(byte[] data, int length, InetAddress host, int port) throws IOException {
		_sendPacket.setData(data);
		_sendPacket.setLength(length);
		_sendPacket.setAddress(host);
		_sendPacket.setPort(port);
		_socket_.send(_sendPacket);
	}

	/***
	 * Same as
	 * <code>send(data, length, host. DiscardUDPClient.DEFAULT_PORT)</code>.
	 ***/
	public void send(byte[] data, int length, InetAddress host) throws IOException {
		send(data, length, host, DEFAULT_PORT);
	}

	/***
	 * Same as
	 * <code>send(data, data.length, host. DiscardUDPClient.DEFAULT_PORT)</code>
	 * .
	 ***/
	public void send(byte[] data, InetAddress host) throws IOException {
		send(data, data.length, host, DEFAULT_PORT);
	}

}
