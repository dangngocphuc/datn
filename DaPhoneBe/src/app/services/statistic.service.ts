import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpBaseService } from './http-base.service';

@Injectable({
  providedIn: 'root'
})
export class StatisticService {
  Url=environment.urlServer
  constructor(private http: HttpBaseService) {}
  getStatisticBrand(params): Observable<any> {
    return this.http.get<any>(`${this.Url}/product/statistic-brand`, params);
  }
  getStatisticCategory(params): Observable<any> {
    return this.http.get<any>(`${this.Url}/product/statistic-category`, params);
  }
  getStatisticBill(params): Observable<any> {
    return this.http.get<any>(`${this.Url}/bill/statistic`, params);
  }
  exportProducts(params): Observable<any> {
    return this.http.exportExcel<any>(`${this.Url}/product/export`, params);
  }
}
