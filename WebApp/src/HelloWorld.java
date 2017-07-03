import beans.*;
import model.Media;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/home2")
public class HelloWorld {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Media> hello(){

        List<Media> l;

        MediaBean mediaBean = new MediaBean();
        MovieBean movieBean = new MovieBean();
        ShowBean showBean = new ShowBean();
        SeasonBean seasonBean = new SeasonBean();
        EpisodeBean episodeBean = new EpisodeBean();

//        l = showBean.getShowById(1);


/*
        l = mediaBean.searchMedia("Game of Thrones");


        Show show = showBean.getShowById(165);
        Season season = seasonBean.getSeasonById(166);
        Episode episode = episodeBean.getEpisodeById(167);

        l.add(show); l.add(season); l.add(episode);
*/
        l = mediaBean.listAllByCategory(2);


        return l;
    }
}
