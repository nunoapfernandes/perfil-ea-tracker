package beans;

import model.Movie;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */
public interface MovieBeanLocal {
    void save(Movie movie);
    Movie getMovieById(int id);

}
