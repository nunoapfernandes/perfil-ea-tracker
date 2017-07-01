package Model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */

@Entity
@Table(name="movie")
@PrimaryKeyJoinColumn(name="media_id", referencedColumnName = "id_media")
public class Movie extends Media{
    public Movie(){}

    @Id
    @GeneratedValue
    @Column(name = "id_movie")
    private int id_movie;
    @Column(name = "slug")
    private String slug;
    @Column(name = "imdb")
    private String imdb;
    @Column(name = "tagline")
    private String tagline;
    @Column(name = "overview")
    private String trailer;
    @Column(name = "runtime")
    private int runtime;
    @Column(name = "homepage")
    private String homepage;
    @Column(name = "language")
    private String language;
    @Column(name = "certification")
    private String certification;
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(
            name = "movie_has_genre",
            joinColumns = @JoinColumn(name = "movie_id"),
            inverseJoinColumns = @JoinColumn(name = "genre_id")
    )
    private Set<Genre> movieGenreList = new HashSet<Genre>();

    public int getId_movie() {
        return id_movie;
    }

    public void setId_movie(int id_movie) {
        this.id_movie = id_movie;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getImdb() {
        return imdb;
    }

    public void setImdb(String imdb) {
        this.imdb = imdb;
    }

    public String getTagline() {
        return tagline;
    }

    public void setTagline(String tagline) {
        this.tagline = tagline;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public int getRuntime() {
        return runtime;
    }

    public void setRuntime(int runtime) {
        this.runtime = runtime;
    }

    public String getHomepage() {
        return homepage;
    }

    public void setHomepage(String homepage) {
        this.homepage = homepage;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getCertification() {
        return certification;
    }

    public void setCertification(String certification) {
        this.certification = certification;
    }

    public Set<Genre> getMovieGenreList() {
        return movieGenreList;
    }

    public void setMovieGenreList(Set<Genre> movieGenreList) {
        this.movieGenreList = movieGenreList;
    }

}
