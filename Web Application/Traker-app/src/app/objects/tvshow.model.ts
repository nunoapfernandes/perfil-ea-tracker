import { Genre } from './genre.model';
import {Season} from './season.model';

export class Tvshow {
    id: number;
    title: string;

    certification: string;
    runtime: number;
    language: string;
    air_date: string;
    status: string;

    genres: Genre[];
    seasons: Season[];
    episodes: number;

    rating: number;
    comments: number;

    country: string;
    premier_date: string;

    overview: string;
    trailer: string;
}
