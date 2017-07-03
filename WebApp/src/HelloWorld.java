import beans.EpisodeBean;
import beans.MediaBean;
import beans.SeasonBean;
import beans.ShowBean;
import model.Episode;
import model.Media;
import model.Season;
import model.Show;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.List;

@Path("/home2")
public class HelloWorld {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Media> hello(){

        List<Media> l = new ArrayList<>();

        MediaBean mediaBean = new MediaBean();
        ShowBean showBean = new ShowBean();
        SeasonBean seasonBean = new SeasonBean();
        EpisodeBean episodeBean = new EpisodeBean();

        l = mediaBean.searchMedia("Game of Thrones");
/*

        Show show = showBean.getShowById(165);


        Season season = seasonBean.getSeasonById(166);


        Episode episode = episodeBean.getEpisodeById(167);

        l.add(show); l.add(season); l.add(episode);
*/


        return l;
    }
}
