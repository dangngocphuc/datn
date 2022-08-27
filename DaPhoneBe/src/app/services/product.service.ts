import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpBaseService } from './http-base.service';

@Injectable({
  providedIn: 'root',
})
export class ProductService {
  Url=environment.urlServer
  constructor(private http: HttpBaseService) {}
  getProducts(params): Observable<any> {
    return this.http.get<any>(`${this.Url}/product`, params);
  }
  getProduct(id): Observable<any> {
    return this.http.get<any>(`${this.Url}/product/` + id, null);
  }
  deleteProduct(id): Observable<any> {
    return this.http.delete<any>(`${this.Url}/product/delete/` + id);
  }
  saveProduct(product): Observable<any> {
    return this.http.post<any>(`${this.Url}/product/save`, product);
  }
  postImage(id: number, file: File): Observable<any> {
    const data: FormData = new FormData();
    data.append('file', file);
    return this.http.postImage<any>(`${this.Url}/product/upload_image/${id}`, data);
  }
}
