import beans.MediaBean;
import beans.MovieBean;
import model.Media;
import model.Movie;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

/**
 * Created by RicardoFerreira on 02/07/2017.
 */
@Path("/home")
public class HelloWorld2 {

        @GET
        @Produces(MediaType.APPLICATION_JSON)
        public Movie hello(){

            MovieBean mBean = new MovieBean();
            Movie movie = mBean.getMovieById(0);

            return movie;
        }

}
