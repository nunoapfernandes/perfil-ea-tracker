package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */

@Entity
@Table(name = "genre")
public class Genre implements Serializable{

    @Id
    @GeneratedValue
    @Column(name = "id_genre")
    private int id_genre;
    @Column(name = "genre")
    private String genre;

    /*@ManyToMany(mappedBy = "movieGenreList")
    private List<Movie> moviesList = new ArrayList<Movie>();

    @ManyToMany(mappedBy = "genres")
    private Set<Show> shows = new HashSet<>();
*/

    @ManyToMany(mappedBy = "genres")
    private List<Media> medias = new LinkedList<>();

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

    /*
    public List<Movie> getMoviesList() {
        return moviesList;
    }

    public void setMoviesList(List<Movie> moviesList) {
        this.moviesList = moviesList;
    }

    public Set<Show> getShowList() {
        return shows;
    }

    public void setShowList(Set<Show> showList) {
        this.shows = showList;
    }
    */

    public List<Media> getMedias() {
        return medias;
    }

    public void setMedias(List<Media> medias) {
        this.medias = medias;
    }
}
