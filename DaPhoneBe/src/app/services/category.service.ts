import { HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { HttpBaseService } from './http-base.service';

@Injectable({
  providedIn: 'root',
})
export class CategoryService {
  Url=environment.urlServer
  constructor(private http: HttpBaseService) {}
  getCategories(params: any): Observable<any> {
    return this.http.get<any>(`${this.Url}/category`, params);
  }
  getAllCategory(): Observable<any> {
    return this.http.get<any>(`${this.Url}/category/all`, null);
  }
  deleteCategory(id): Observable<any> {
    return this.http.delete<any>(`${this.Url}/category/delete/` + id);
  }
  saveCategory(category): Observable<any> {
    return this.http.post<any>(`${this.Url}/category/save`, category);
  }
}
