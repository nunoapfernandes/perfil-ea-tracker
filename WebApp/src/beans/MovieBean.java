package beans;

import model.Movie;
import persistence.MovieDAO;

import javax.ejb.Stateless;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */
@Stateless(name = "MovieEJB")
public class MovieBean implements MovieBeanLocal{
    @Override
    public void save(Movie movie) {
        MovieDAO.registerMovie(movie);
    }

    @Override
    public Movie getMovieById(int id) {
        return MovieDAO.getMovie(id);
    }
}
