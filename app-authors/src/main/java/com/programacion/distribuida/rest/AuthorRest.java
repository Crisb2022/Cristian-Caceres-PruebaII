package com.programacion.distribuida.rest;

import com.programacion.distribuida.db.Authors;
import com.programacion.distribuida.servicios.AuthorRepository;
import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.media.Content;
import org.eclipse.microprofile.openapi.annotations.media.Schema;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;
import org.hibernate.annotations.Parameter;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

@ApplicationScoped
@Path("/authors")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class AuthorRest {

    @GET
    @Path("/{id}")
    @Operation(summary = "Buscar por ID",
            description = "Se obtiene el author por medio del ID")
    @APIResponse(responseCode = "200", description = "Encontrado de forma satisfactoria", content =
    @Content(mediaType = "application.json", schema = @Schema(implementation = Authors.class)))
    @APIResponse(responseCode = "400", description = "No se ha encontrado lo requerido")
    @APIResponse(responseCode = "500", description = "Fallo del interno del servidor")
    public Authors findById(@PathParam("id") Long id) {
        return repository.findById(id);
    }

    @Inject AuthorRepository repository;


    @GET
    @Operation(summary = "Busca Todos", description = "Se obtienen todos los author almacenados")
    @APIResponse(responseCode = "200", description = "Desplegado correctamente", content =
    @Content(mediaType = "application.json", schema = @Schema(implementation = Authors.class)))
    @APIResponse(responseCode = "400", description = "No se ha encontrado lo requerido")
    @APIResponse(responseCode = "500", description = "Fallo del interno del servidor")
    public List<Authors> findAll() {
        return repository
                .findAll()
                .list();
    }

    @POST
    @Operation(summary = "Insertar Author", description = "Se crea el author y se lo almacena")
    @APIResponse(responseCode = "200", description = "Insertado correctamente", content =
    @Content(mediaType = "application.json", schema = @Schema(implementation = Authors.class)))
    @APIResponse(responseCode = "400", description = "No se ha encontrado lo requerido")
    @APIResponse(responseCode = "500", description = "Fallo del interno del servidor")
    public void insert(Authors obj) {
        repository.persist(obj);
    }

    @PUT
    @Path("/{id}")
    @Operation(summary = "Actualizar", description = "Se actualiza el author por medio del ID y cambian sus parametros")
    @APIResponse(responseCode = "200", description = "Actualizado correctamente", content =
    @Content(mediaType = "application.json", schema = @Schema(implementation = Authors.class)))
    @APIResponse(responseCode = "400", description = "No se ha encontrado lo requerido")
    @APIResponse(responseCode = "500", description = "Fallo del interno del servidor")
    public void update(Authors obj, @PathParam("id") Long id) {

        var author = repository.findById(id);

        author.setFirtName(obj.getFirtName());
        author.setLastName(obj.getLastName());
    }


    @DELETE
    @Path("/{id}")
    @Operation(summary = "Eliminar", description = "Se elimina el author por medio del ID")
    @APIResponse(responseCode = "200", description = "Eliminado correctamente", content =
    @Content(mediaType = "application.json", schema = @Schema(implementation = Authors.class)))
    @APIResponse(responseCode = "400", description = "No se ha encontrado lo requerido")
    @APIResponse(responseCode = "500", description = "Fallo del interno del servidor")
    public void delete( @PathParam("id") Long id ) {
        repository.deleteById(id);
    }
}
