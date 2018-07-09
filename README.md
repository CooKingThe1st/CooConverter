# CooConverter

Hiện chỉ mới support chuyển folder -> pdf
Ví dụ ta có folder foo, chứa các file ảnh ( chỉ mới support .jpg và .png)
Ta muốn tạo thành 1 file pdf chứa các file ảnh đó
Chi tiết hơn thì coi screenshots.

Setup
1. MỞ terminal, chạy lệnh $ sudo apt-get install imagemagick pdftk
2. Download các file bash về và bỏ vào thư mục cha của các thư mục cần convert

Cách dùng
1. cd vào thư mục chứa các file bash và chạy $ bash main.sh

Kết quả:
1. Sau khi chạy xong, ta có folder mới tên là CooConverter trong đó chứa các file .pdf mà tên file tương ứng với tên thư mục được convert
2. Đồng thời ta có 1 file log là Skip_File.log, chứa tên của các file không được convert, thường là vì trong đó không có file image nào. 

Screenshots:
1. Sau khi download về:
  ![ alt text ](https://imgur.com/a/vwGRKKe)
2. Đưa các folder ảnh về cùng 1 thư mục:
  ![ alt text ](https://imgur.com/a/YRpjE1K)
  (build_rotate và rain là các folder chứa các file ảnh)
3. mở terminal trong thư mục và chạy lệnh $ bash main.sh
  ![ alt text ](https://imgur.com/a/cJzbZfS)
  ![ alt text ](https://imgur.com/a/mkcA8PB)
4. kết quả: ta có các file pdf trong thư mục CooConverter
  ![ alt text ](https://imgur.com/a/0vCQ20g)
