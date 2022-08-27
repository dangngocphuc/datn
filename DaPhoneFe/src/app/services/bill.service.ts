import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpBaseService } from './http-base.service';

@Injectable({
  providedIn: 'root',
})
export class BillService {
  Url=environment.urlServer
  constructor(private http: HttpBaseService) {}
  getBills(params): Observable<any> {
    return this.http.get<any>(`${this.Url}/bill`, params);
  }
 
  getBillDetail(id): Observable<any> {
    return this.http.get<any>(`${this.Url}/bill-detail/` + id, null);
  }
 
  saveBill(bill): Observable<any> {
    return this.http.post<any>(`${this.Url}/bill/payment`, bill);
  }
}
