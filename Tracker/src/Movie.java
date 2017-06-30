import javax.persistence.*;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */

@Entity
@Table(name="movie")
public class Movie {
    public Movie(){}

    @Id
    @GeneratedValue
    @Column(name = "id_movie")
    private int id_movie;
    @Column(name = "title")
    private String title;
    @Column(name = "slug")
    private String slug;
    @Column(name = "imdb")
    private String imdb;
    @Column(name = "tmdb")
    private String tmdb;
    @Column(name = "tagline")
    private String tagline;
    @Column(name = "overview")
    private String overview;
    @Column(name = "released")
    private Date released;
    @Column(name = "trailer")
    private String trailer;
    @Column(name = "runtime")
    private int runtime;
    @Column(name = "homepage")
    private String homepage;
    @Column(name = "rating_trakt")
    private DecimalFormat rating_trankt;
    @Column(name = "language")
    private String language;
    @Column(name = "certification")
    private String certification;
    @Column(name = "image_path")
    private String image_path;
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(
            name = "movie_has_genre",
            joinColumns = @JoinColumn(name = "movie_id"),
            inverseJoinColumns = @JoinColumn(name = "genre_id")
    )
    private Set<Genre> movieGenreList = new HashSet<Genre>();
    @OneToMany(mappedBy = "primaryKey.movie", cascade = CascadeType.ALL)
    private Set<UserMovie> userMovies = new HashSet<UserMovie>();

    public int getId_movie() {
        return id_movie;
    }

    public void setId_movie(int id_movie) {
        this.id_movie = id_movie;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public String getTmdb() {
        return tmdb;
    }

    public void setTmdb(String tmdb) {
        this.tmdb = tmdb;
    }

    public String getTagline() {
        return tagline;
    }

    public void setTagline(String tagline) {
        this.tagline = tagline;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public Date getReleased() {
        return released;
    }

    public void setReleased(Date released) {
        this.released = released;
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

    public DecimalFormat getRating_trankt() {
        return rating_trankt;
    }

    public void setRating_trankt(DecimalFormat rating_trankt) {
        this.rating_trankt = rating_trankt;
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

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public Set<Genre> getMovieGenreList() {
        return movieGenreList;
    }

    public void setMovieGenreList(Set<Genre> movieGenreList) {
        this.movieGenreList = movieGenreList;
    }

    public Set<UserMovie> getUserMovies() {
        return userMovies;
    }

    public void setUserMovies(Set<UserMovie> userMovies) {
        this.userMovies = userMovies;
    }

    public void addUserMovie(UserMovie userMovie){
        this.userMovies.add(userMovie);
    }
}
