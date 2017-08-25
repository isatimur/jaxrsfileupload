package xyz.isatimur.knowledgebase;

import org.apache.commons.io.IOUtils;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 * @author Timur Isachenko {@literal <tisachenko@at-consulting.ru>} on 25.08.2017.
 */
@Path("/upload")
public class ServiceJaxRS {

    @POST
    @Path("/file")
    @Consumes({MediaType.MULTIPART_FORM_DATA})
    public Response uploadFile(
            @FormDataParam("file") InputStream fileInputStream,
            @FormDataParam("file") FormDataContentDisposition fileMetaData) throws Exception {
        try {
            File file = new File(fileMetaData.getFileName());
            IOUtils.copy(fileInputStream, new FileOutputStream(file));
            System.out.println("Upload File Path : " + file.getAbsolutePath());

        } catch (IOException e) {
            throw new WebApplicationException("Error while uploading file. Please try again !!");
        }
        return Response.ok("Data uploaded successfully !!").build();
    }

}