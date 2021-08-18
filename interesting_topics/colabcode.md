## Chạy Kaggle hoặc Colab trên Vscode
Cơ chế hoạt động của cái này là sẽ dùng bên thứ 3 `ngrok` để connect `VS Code` và `Kaggle` hoặc `Colab`. Ở hướng dẫn này thì mình dùng `Kaggle`

### 1. Tạo tài khoản trên `ngrok` tại địa chỉ https://dashboard.ngrok.com/signup sau đó copy cái `authtoken` ở trang **Setup & Installation**
![](images/interesting_topics/colabcode/2021-06-25-16-01-04.png)

### 2. Tạo file notebook mới trên Kaggle sau đó cài thư viện `colabcode` (Google Colab tương tự), nhớ turn on cả GPU để server VS Code dùng được GPU

```sh
!pip install colabcode
```

![](images/interesting_topics/colabcode/2021-06-25-15-55-09.png)

### 3. Kết nối tới server của `ngrok`

```python
from colabcode import ColabCode
ColabCode(
    port=10000, 
    password="abcdef", 
    authtoken="1uPXZm2sN4DJlzJpob6fso2r5Jy_4NAksdacaHkfmFGLxEZvG"
)
```
Thông tin tham số:
- `port`: cổng kết nối tới ngrok
- `password` (optional): password để connect tới server vscode
- `authtoken`: token lấy từ ngrok tại B1, mục đích của cái token là giúp không bị limit connection tới ngrok

![](images/interesting_topics/colabcode/2021-06-25-16-09-01.png)

### 4. Click vào cái đường dẫn `NgrokTunnel` sau đó vào vscode server (nếu có password thì hệ thống sẽ yêu cầu thêm nhập password)

![](images/interesting_topics/colabcode/2021-06-25-16-13-03.png)

- Mở folder bất kỳ, tạo thử file `test.python` (ở đây mình dùng folder `/home/nguyenlm/test` tự tạo bằng `mkdir -p /home/nguyenlm/test`). Ở đây check thành công sử dụng được GPU nhưng theo giới hạn của Kaggle thì chỉ dùng được 25-30h/tuần.

    ![](images/interesting_topics/colabcode/2021-06-25-16-28-34.png)

- Cài thử `nvtop`, ở đây là server Ubuntu 18.04 và có quyền root nên khi cài thì không cần `sudo`
    ```sh
    # install C dependencies
    apt install cmake libncurses5-dev libncursesw5-dev git

    # build nvtop
    git clone https://github.com/Syllo/nvtop.git
    mkdir -p nvtop/build && cd nvtop/build
    cmake ..
    make
    make install
    ```

- Chạy thử `nvtop`
  
  ![](images/interesting_topics/colabcode/2021-06-25-16-36-17.png)

- Chạy thử `htop`
  
  ![](images/interesting_topics/colabcode/2021-06-25-16-37-47.png)

- Chạy thử `df -h` để check bộ nhớ
  
  ![](images/interesting_topics/colabcode/2021-06-25-16-38-47.png)