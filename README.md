# peoplesemsegnet-on-deepstream
peoplesemsegnet-on-deepstream は、DeepStream 上で PeopleSemSegNet の AIモデル を動作させるマイクロサービスです。  

## 動作環境
- NVIDIA 
    - DeepStream
- PeopleSemSegNet
- Docker
- TensorRT Runtime

## PeopleSemSegNetについて
PeopleSemSegNet は、画像内の人を背景から分離するセマンティックセグメンテーションマスクを返すAIモデルです。

## 動作手順
### Dockerコンテナの起動
Makefile に記載された以下のコマンドにより、PeopleSemSegNet の Dockerコンテナ を起動します。
```
docker-run: 
	docker-compose -f docker-compose.yaml up -d
```
### ストリーミングの開始
Makefile に記載された以下のコマンドにより、DeepStream 上の PeopleSemSegNet でストリーミングを開始します。  
```
stream-start:
	xhost +
	docker exec -it deepstream-peoplesemsegnet ./ds-tao-segmentation \
		-c /home/latona/sirius/AI/noguchi/0428/peoplesemsegnet-on-deepstream/config_infer_primary_peoplesemsegnet.txt -i /dev/video0 -d
```
## 相互依存関係にあるマイクロサービス  
本マイクロサービスを実行するために PeopleSemSegNet の AIモデルを最適化する手順は、[peoplesemsegnet-on-tao-toolkit](https://github.com/latonaio/peoplesemsegnet-on-tao-toolkit)を参照してください。  


## engineファイルについて
engineファイルである peoplesemsegnet.etlt_b1_gpu0_fp16.engine は、[peoplesemsegnet-on-tao-toolkit](https://github.com/latonaio/peoplesemsegnet-on-tao-toolkit)と共通のファイルであり、当該レポジトリで作成した engineファイルを、本リポジトリで使用しています。  
