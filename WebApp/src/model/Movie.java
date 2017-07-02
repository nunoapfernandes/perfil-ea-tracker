package model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */

@Entity
@Table(name="movie")
public class Movie extends Media implements Serializable{

    @Column(name = "slug")
    private String slug;
    @Column(name = "imdb")
    private String imdb;
    @Column(name = "tagline")
    private String tagline;
    @Column(name = "trailer")
    private String trailer;
    @Column(name = "runtime")
    private int runtime;
    @Column(name = "homepage")
    private String homepage;
    @Column(name = "language")
    private String language;
    @Column(name = "certification")
    private String certification;


    //@Column(name = "media_id", insertable = false, updatable = false)
    //private int media_id;
    /*@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(
            name = "movie_has_genre",
            joinColumns = @JoinColumn(name = "media_id"),
            inverseJoinColumns = @JoinColumn(name = "genre_id")
    )
    private List<Genre> movieGenreList = new ArrayList<Genre>();
    */
/*
    public int getMedia_id() {
        return media_id;
    }

    public void setMedia_id(int media_id) {
        this.media_id = media_id;
    }



    public int getId_movie() {
        return id_movie;
    }

    public void setId_movie(int id_movie) {
        this.id_movie = id_movie;
    }
*/
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

    /*public List<Genre> getMovieGenreList() {
        return movieGenreList;
    }*/

    /*public void setMovieGenreList(List<Genre> movieGenreList) {
        this.movieGenreList = movieGenreList;
    }*/

}
