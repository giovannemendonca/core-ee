package dev.giovannemendonca.coreee;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Response;

@Path("/admin-tools")
public class HealthController {

    @GET
    @Path("/health")
    public Response check() {
        return Response.ok("Application is running!").build();
    }
}