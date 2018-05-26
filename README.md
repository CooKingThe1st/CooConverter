# CooConverter

Hiện chỉ mới support chuyển folder -> pdf
Ví dụ ta có folder foo, chứa các file ảnh ( chỉ mới support .jpg và .png)
Ta muốn tạo thành 1 file pdf chứa các file ảnh đó

Setup
1. Down các file .sh về
2. MỞ terminal, chạy lệnh $ sudo apt-get install imagemagick
3. cd vào thư mục và chạy $ chmod +x main.sh

Cách dùng
1. bỏ file main.sh và convert.sh vào folder foo
2. MỞ terminal, cd vào thư mục và chạy $ ./main.sh

Kết quả
Sau khi chạy xong, ta có folder mới tên là CooConverter
trong đó chứa các file .pdf mà tên file tương ứng với tên thư mục được convert
