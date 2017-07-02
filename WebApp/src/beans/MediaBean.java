package beans;

import model.Media;
import model.Season;
import model.Show;
import model.User;
import persistence.MediaDAO;

import javax.ejb.Stateless;
import java.util.List;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */
@Stateless(name = "MediaEJB")
public class MediaBean implements MediaBeanLocal{

    public MediaBean() {}

    @Override
    public List<Media> searchMedia(String name) {
        return MediaDAO.searchMedia(name);
    }

    @Override
    public List<Media> listAllMedia() {
        return MediaDAO.listAllMedia();
    }

    @Override
    public List<Media> listUserWatchedMedia(User user) {
        return MediaDAO.listUserWatchedMedia(user.getId_user());
    }

    @Override
    public List<Media> listUserWatchListMedia(User user) {
        return MediaDAO.listUserWatchListMedia(user.getId_user());
    }

    @Override
    public List<Media> listAllByCategory(int category) {
        return MediaDAO.listAllByCategory(category);
    }

    @Override
    public List<Media> listAllWatchedByCategory(int category, User user) {
        return MediaDAO.listAllWatchedByCategory(category, user.getId_user());
    }

    @Override
    public List<Media> listAllWatchListByCategory(int category, User user) {
        return MediaDAO.listAllWatchListByCategory(category, user.getId_user());
    }

    @Override
    public List<Media> listShowSeasons(Show show) {
        return null;
        //return MediaDAO.listShowSeasons(show.getId_show());
    }

    @Override
    public List<Media> listSeasonEpisodes(Season season) {
        return null;
        //return MediaDAO.listSeasonEpisodes(season.getId_season());
    }
}
