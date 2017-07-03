package model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="episode")
@PrimaryKeyJoinColumn(name="episode_id", referencedColumnName = "id_media")
public class Episode extends Media implements Serializable{

    @Column(name = "episode_id", nullable = false, insertable = false, updatable = false)
    private int episode_id;
    @Column(name = "runtime")
    private int runtime;
    @Column(name = "number")
    private int number;
    @Column(name = "imdb")
    private String imdb;

    public int getEpisode_id() {
        return episode_id;
    }

    public void setEpisode_id(int episode_id) {
        this.episode_id = episode_id;
    }

    public int getRuntime() {
        return runtime;
    }

    public void setRuntime(int runtime) {
        this.runtime = runtime;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getImdb() {
        return imdb;
    }

    public void setImdb(String imdb) {
        this.imdb = imdb;
    }
}
