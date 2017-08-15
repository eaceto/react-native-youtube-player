declare module "react-native-image-picker" {

    interface Options {
        title?: string;
        shareUrl?: string;
        videoQuality?: 'low' | 'medium' | 'high';
    }

    class YoutubePlayer {
        static playVideoWithID(id: string, options: Options): void;
    }

    export = YoutubePlayer;
}
