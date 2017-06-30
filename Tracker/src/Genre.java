import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */
public class Genre {
    public Genre(){}

    @Id
    @GeneratedValue
    @Column(name = "id_genre")
    private int id_genre;
    @Column(name = "genre")
    private String genre;
    @ManyToMany(mappedBy = "movieGenreList")
    private Set<Movie> moviesList = new HashSet<Movie>();
    @ManyToMany(mappedBy = "showGenreList")
    private Set<Show> showList = new HashSet<Show>();

    public int getId_genre() {
        return id_genre;
    }

    public void setId_genre(int id_genre) {
        this.id_genre = id_genre;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public Set<Movie> getMoviesList() {
        return moviesList;
    }

    public void setMoviesList(Set<Movie> moviesList) {
        this.moviesList = moviesList;
    }

    public Set<Show> getShowList() {
        return showList;
    }

    public void setShowList(Set<Show> showList) {
        this.showList = showList;
    }
}
