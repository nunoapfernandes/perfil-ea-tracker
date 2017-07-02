package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import model.Genre;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */

@Entity
@Table(name="tvshow")
@PrimaryKeyJoinColumn(name="show_id", referencedColumnName = "id_media")
public class Show extends Media implements Serializable{

    //@Id
    //@GeneratedValue
    //@Column(name = "id_tvshow")
    //private int id_tvshow;
    @Column(name = "slug")
    private String slug;
    @Column(name = "imdb")
    private String imdb;
    @Column(name = "aired_day")
    private String aired_day;
    @Column(name = "aired_time")
    private String aired_time;
    @Column(name = "aired_timezone")
    private String aired_timezone;
    @Column(name = "runtime")
    private int runtime;
    @Column(name = "certification")
    private String certification;
    @Column(name = "network")
    private String network;
    @Column(name = "country")
    private String country;
    @Column(name = "trailer")
    private String trailer;
    @Column(name = "homepage")
    private String homepage;
    @Column(name = "status")
    private String status;
    @Column(name = "language")
    private String language;
    @Column(name = "aired_episodes")
    private int aired_episodes;
    //@Column(name = "media_id", insertable = false, updatable = false)
    //private int media_id;
    @Column(name = "seasons")
    private int seasons;


    @OneToMany(fetch = FetchType.LAZY, mappedBy = "show")
    private List<Season> seasonsList = new ArrayList<>();

/*
    public int getId_tvshow() {
        return id_tvshow;
    }

    public void setId_show(int id_tvshow) {
        this.id_tvshow = id_tvshow;
    }
*/

/*
    public int getMedia_id() {
        return media_id;
    }

    public void setMedia_id(int media_id) {
        this.media_id = media_id;
    }
*/
    /*
    public List<Genre> getGenres() {
        return genres;
    }

    public void setGenres(List<Genre> genres) {
        this.genres = genres;
    }*/

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

    public String getAired_day() {
        return aired_day;
    }

    public void setAired_day(String aired_day) {
        this.aired_day = aired_day;
    }

    public String getAired_time() {
        return aired_time;
    }

    public void setAired_time(String aired_time) {
        this.aired_time = aired_time;
    }

    public String getAired_timezone() {
        return aired_timezone;
    }

    public void setAired_timezone(String aired_timezone) {
        this.aired_timezone = aired_timezone;
    }

    public int getRuntime() {
        return runtime;
    }

    public void setRuntime(int runtime) {
        this.runtime = runtime;
    }

    public String getCertification() {
        return certification;
    }

    public void setCertification(String certification) {
        this.certification = certification;
    }

    public String getNetwork() {
        return network;
    }

    public void setNetwork(String network) {
        this.network = network;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getTrailer() {
        return trailer;
    }

    public void setTrailer(String trailer) {
        this.trailer = trailer;
    }

    public String getHomepage() {
        return homepage;
    }

    public void setHomepage(String homepage) {
        this.homepage = homepage;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getAired_episodes() {
        return aired_episodes;
    }

    public void setAired_episodes(int aired_episodes) {
        this.aired_episodes = aired_episodes;
    }

    public int getSeasons() {
        return seasons;
    }

    public void setSeasons(int seasons) {
        this.seasons = seasons;
    }

    public List<Season> getSeasonsList() {
        return seasonsList;
    }

    public void setSeasonsList(List<Season> seasonsList) {
        this.seasonsList = seasonsList;
    }

}
