import { Genre } from './genre.model';

export class Episode {
    id: number;
    title: string;
    episode_number: number;

    certification: string;
    runtime: number;
    language: string;
    air_date: string;

    genres: Genre[];
    rating: number;
    comments: number;

    country: string;
    aired: string;

    overview: string

}
