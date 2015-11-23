//
//  FSPathDefines.h
//  FSearcher
//
//  Created by Pavlo Dumyak on 11/13/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#ifndef FSearcher_FSPathDefines_h
#define FSearcher_FSPathDefines_h

#define SITE_ADDRESS @"http://api.themoviedb.org/"
#define PAGE @"?page="
#define API_KEY @"&&api_key=47bee5b57fa5d8d57c9027a0bc5b7204"
#define API_KEY_FOR_IM @"?api_key=47bee5b57fa5d8d57c9027a0bc5b7204"
#define TOP_RATED @"3/movie/top_rated"

#define POPULAR @"3/movie/popular"

#define GET_IMAGE_PATH @"3/movie/"
#define IM @"/images"

#define UPCOMING @"3/movie/upcoming"
#pragma --mark download Image
#define  IMAGE @"https://image.tmdb.org/t/p/w396"

//http:
//api.themoviedb.org/3/search/movie?query=fight&&api_key=47bee5b57fa5d8d57c9027a0bc5b7204


#pragma mark --searching


#define SEARCH_PATH_BEGIN @"3/search/movie?query="


//http:
//api.themoviedb.org/3/movie/666/videos?api_key=47bee5b57fa5d8d57c9027a0bc5b7204
#define VIDEOS @"/videos" 
#endif
