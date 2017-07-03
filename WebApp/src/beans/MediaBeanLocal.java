package beans;

import model.Media;
import model.Season;
import model.Show;
import model.User;

import java.util.List;

public interface MediaBeanLocal {
    Media getMediaById(int idMedia);
    List<Media> searchMedia(String name);
    List<Media> listAllMedia();
    List<Media> listUserWatchedMedia(User user);
    List<Media> listUserWatchListMedia(User user);
    List<Media> listAllByCategory(int category);
    List<Media> listAllWatchedByCategory(int category, User user);
    List<Media> listAllWatchListByCategory(int category, User user);
    List<Media> listShowSeasons(Show show);
    List<Media> listSeasonEpisodes(Season season);

}
