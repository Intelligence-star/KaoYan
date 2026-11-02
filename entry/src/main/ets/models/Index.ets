export interface User {
  id: string
  username: string
  password: string
  avatar: string
  token: string
  nickName?: string
  totalTime?: number      // 学习时长
  clockinNumbers?: number  // 打卡次数
}

// 新闻 Item
export interface NewsItem {
  id: string
  stem: string
  content: string
  priority: number
  likeCount: number
  views: number
  createdAt: string
  readFlag: 0 | 1
}

// 研经 Item
export interface QuestionItem {
  id: string
  stem: string
  content: string
  likeCount: number
  views: number
  creatorName: string
  creatorAvatar: ResourceStr
  createdAt: string
  likeFlag: 0 | 1
  collectFlag: 0 | 1
}
