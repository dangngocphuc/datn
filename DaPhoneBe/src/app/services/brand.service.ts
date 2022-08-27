import { HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpBaseService } from './http-base.service';

@Injectable({
  providedIn: 'root',
})
  
export class BrandService {
  Url=environment.urlServer
  constructor(private http: HttpBaseService) {}
  getBrands(params: any): Observable<any> {
    return this.http.get<any>(`${this.Url}/brand`, params);
  }
  getAllBrand(): Observable<any> {
    return this.http.get<any>(`${this.Url}/brand/all`, null);
  }
  deleteBrand(id): Observable<any> {
    return this.http.delete<any>(`${this.Url}/brand/delete/` + id);
  }
  saveBrand(brand): Observable<any> {
    return this.http.post<any>(`${this.Url}/brand/save`, brand);
  }
}
