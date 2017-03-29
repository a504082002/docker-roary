from app.tasks import roary
import os
import time


if __name__ == '__main__':
    print("sleep for 10 sec")
    time.sleep(10)
    # prepare uploads
    uploads = []
    for name in os.listdir("/input"):
        filename = os.path.join("/input", name)
        with open(filename, "r") as f:
            uploads.append((name, f.read()))

    # run and wait for return
    result = roary.s(uploads, 95, 4).apply_async()
    while not result.ready():
        time.sleep(10)

    # receive and write result
    filename, file = result.get()
    print(filename)
    with open(os.path.join("/output", filename), "w") as f:
        f.write(file)
