package com.nachosoto.protobuf;

import com.nachosoto.protobuf.messages.AddressBook;

import java.io.OutputStream;

import static spark.Spark.get;
import static spark.Spark.port;

/**
 * A simple example just showing some basic functionality
 */
public class HelloWorld {

    public static void main(String[] args) {
        port(3000);

        get("/", (request, response) -> {
            AddressBook.Person person = AddressBook.Person.newBuilder()
                    .setEmail("email")
                    .setName("name")
                    .setId(200)
                    .build();

            response.type("application/binary");
            response.status(200);

            OutputStream os = response.raw().getOutputStream();
            person.writeTo(os);
            os.flush();
            os.close();

            return null;
        });
    }
}