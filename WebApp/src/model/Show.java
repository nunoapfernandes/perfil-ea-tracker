package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name="tvshow")
@PrimaryKeyJoinColumn(name="show_id", referencedColumnName = "id_media")
public class Show extends Media implements Serializable{

    @Column(name = "show_id", nullable = false, insertable = false, updatable = false)
    private int show_id;
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
    @Column(name = "seasons")
    private int seasons;
    @OneToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "tvshow_season", joinColumns = {@JoinColumn (name = "show_id")},inverseJoinColumns = { @JoinColumn (name = "season_id")})
    private Set<Season> seasonsList = new HashSet<>();

    public int getShow_id() {
        return show_id;
    }

    public void setShow_id(int show_id) {
        this.show_id = show_id;
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

    public Set<Season> getSeasonsList() {
        return seasonsList;
    }

    public void setSeasonsList(Set<Season> seasonsList) {
        this.seasonsList = seasonsList;
    }
}
