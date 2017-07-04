

import { Component } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {HttpService} from '../../http.service';


@Component({
  selector: 'app-tvshow-page',
  templateUrl: './tvshow-page.component.html',
  styleUrls: ['./tvshow-page.component.css'],
  providers: [HttpService]
})

export class TvShowPage {

  response2: Object = {};



  constructor(private route: ActivatedRoute, private httpService: HttpService) {
    this.route.params.subscribe(params => {
      this.httpService.getShow(params['id'])
        .subscribe(data => this.response2 = data, a => console.log(a.message));
    });
  }
}
