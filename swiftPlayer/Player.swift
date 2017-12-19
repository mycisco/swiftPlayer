//
//  Player.swift
//  swiftPlayer
//
//  Created by marbean on 2017. 2. 15..
//  Copyright © 2017년 Kim. Dae-Hyun. All rights reserved.
//

import Foundation
import Metal
import FFmpeg

public class Player: CustomDebugStringConvertible {
    public var debugDescription: String {
        return ""
    }

    var formatContext: UnsafeMutablePointer<AVFormatContext>?
    var avStream: UnsafeMutablePointer<AVStream>?
    
    public init?(path: String) {

        av_register_all()
        avformat_network_init()

        
        /*
         avformat_open_input : 파일의 헤더를 분석하여 파일 형식에 대한 정보를 AVFormatContext 구조체에 기록 할 수 있습니다.
         NULL 으로 설정하면, libavformat 에서 자동으로 감지
         */
        guard av_success_desc(avformat_open_input(&self.formatContext, path, nil, nil), "open failed -> \(path)") else {
            return nil
        }
        
        /*
         avformat_find_stream_info : pFormatCtx->stream 정보를 기록, 내용을 확인 하려면 dump_format 사용
         */
        guard av_success_desc(avformat_find_stream_info(self.formatContext, nil), "find stream info") else {
            return nil
        }
        
        av_dump_format(formatContext, -1, path, 0)

        for i in 0..<Int(self.formatContext!.pointee.nb_streams) {
            let s = self.formatContext?.pointee.streams[i]
            if s?.pointee.codecpar.pointee.codec_type.rawValue == AVMEDIA_TYPE_VIDEO.rawValue {
//                self.avStream = s
            }
        }
        
        
        
        
//        if let videos: AVStream = self.formatContext?.pointee.streams[Int(AVMEDIA_TYPE_VIDEO.rawValue)] {
//            self.streamByType[AVMEDIA_TYPE_VIDEO.rawValue] = videos
//        }
        
        
//        if let vidoes = self.formatContext?.pointee.streams(AVMEDIA_TYPE_VIDEO) {
//            self.streamByType[AVMEDIA_TYPE_VIDEO.rawValue] = vidoes
//        }
        
        
        
        

    }
}

extension AVFormatContext {
    mutating func streamArray(_ type: AVMediaType) -> [SweetStream] {
        var streams: [SweetStream] = []
        for i in 0..<Int32(self.nb_streams) {
//            guard let s = SweetStream(format: &self, type: type, index: i), s.open() else {
//                continue
//            }
//            streams.append(s)
        }
        return streams
    }
}
