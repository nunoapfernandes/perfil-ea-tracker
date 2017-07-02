import beans.MediaBean;
import beans.MovieBean;
import beans.UserBean;
import model.Media;
import model.Movie;
import model.User;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

/**
 * Created by RicardoFerreira on 02/07/2017.
 */
@Path("/home2")
public class HelloWorld {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Media> hello(){
        MediaBean mBean = new MediaBean();
        List<Media> medias = mBean.listAllMedia();

        return medias;
    }
}
