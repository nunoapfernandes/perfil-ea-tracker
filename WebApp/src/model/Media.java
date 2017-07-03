package model;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.*;

@Entity
@Table(name = "media")
@Inheritance(strategy=InheritanceType.JOINED)
public class Media implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_media", unique = true, nullable = false)
    private int id_media;
    @Column (name = "title")
    private String title;
    @Column (name = "tmdb")
    private String tmdb;
    @Column (name = "overview", length = 5000)
    private String overview;
    @Column (name = "rating_trakt")
    private BigDecimal rating_trakt;
    @Column (name = "released")
    private Date released;
    @Column (name = "image_path")
    private String image_path;
    @Column (name = "category")
    private int category;
    @Column (name = "rating")
    private BigDecimal rating;
    @OneToMany(mappedBy = "media", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<UserMedia> users = new ArrayList<>();
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "media_genre", joinColumns = { @JoinColumn(name = "medias_id_media") }, inverseJoinColumns = { @JoinColumn(name = "genres_id_genre") })
    private List<Genre> genres = new ArrayList<>();

    public int getId_media() {
        return id_media;
    }

    public void setId_media(int id_media) {
        this.id_media = id_media;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTmdb() {
        return tmdb;
    }

    public void setTmdb(String tmdb) {
        this.tmdb = tmdb;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public BigDecimal getRating_trakt() {
        return rating_trakt;
    }

    public void setRating_trakt(BigDecimal rating_trakt) {
        this.rating_trakt = rating_trakt;
    }

    public Date getReleased() {
        return released;
    }

    public void setReleased(Date released) {
        this.released = released;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }

    public List<UserMedia> getUsers() {
        return users;
    }

    public void setUsers(List<UserMedia> users) {
        this.users = users;
    }

    public List<Genre> getGenres() {
        return genres;
    }

    public void setGenres(List<Genre> genres) {
        this.genres = genres;
    }

}
