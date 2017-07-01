package Model;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */


@Entity
@Inheritance(strategy=InheritanceType.JOINED)
public abstract class Media implements Serializable {
    public Media(){}

    @Id
    @GeneratedValue
    @Column (name = "id_media")
    private Integer id_media;
    @Column (name = "title")
    private String title;
    @Column (name = "tmdb")
    private String tmdb;
    @Column (name = "overview")
    private String overview;
    @Column (name = "rating_trakt")
    private DecimalFormat rating_trakt;
    @Column (name = "released")
    private Date released;
    @Column (name = "image_path")
    private String image_path;
    @Column (name = "category")
    private int category;
    @Column (name = "rating")
    private BigDecimal rating;
    @OneToMany(mappedBy = "primaryKey.media", cascade = CascadeType.ALL)
    private Set<UserMedia> userMedia = new HashSet<UserMedia>();

    public Integer getId_media() {
        return id_media;
    }

    public void setId_media(Integer id_media) {
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

    public DecimalFormat getRating_trakt() {
        return rating_trakt;
    }

    public void setRating_trakt(DecimalFormat rating_trakt) {
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

    public Set<UserMedia> getUserMedia() {
        return userMedia;
    }

    public void setUserMedia(Set<UserMedia> userMedia) {
        this.userMedia = userMedia;
    }
}
