package Beans;

import Model.Media;
import Model.Season;
import Model.Show;
import Model.User;

import java.util.List;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */
public interface MediaBeanLocal {
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
