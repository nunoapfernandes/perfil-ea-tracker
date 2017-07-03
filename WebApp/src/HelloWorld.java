import beans.EpisodeBean;
import model.Episode;
import model.Media;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/home2")
public class HelloWorld {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Media hello(){
        EpisodeBean episodeBean = new EpisodeBean();
        Episode e = episodeBean.getEpisodeById(13);
        return e;
    }
}
