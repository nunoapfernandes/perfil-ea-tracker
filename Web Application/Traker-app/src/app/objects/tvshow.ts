import { genre } from './genre'

export class tvshow {
    id:number;
    title: string;

    certification: string;
    runtime: number;
    language: string;
    air_date: string;
    status: string;

    genres: genre[];
    episodes: number;

    rating: number;
    comments: number;

    country: string;
    premier_date: string;

    overview: string;
    trailer: string;
}