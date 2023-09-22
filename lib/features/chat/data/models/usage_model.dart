

import 'package:chat_gpt/features/chat/domain/entities/usage.dart';

class UsageModel extends Usage {
    const UsageModel({
      required int completionTokens,
      required int promptTokens,
      required int totalTokens,
    }):super(completionTokens: completionTokens , promptTokens: promptTokens , totalTokens: totalTokens);

    factory UsageModel.fromJson(Map<String , dynamic> json) => UsageModel(
        completionTokens: json["completion_tokens"],
        promptTokens: json["prompt_tokens"],
        totalTokens: json["total_tokens"]);

    factory UsageModel.fromUsage(Usage usage){
      if(usage is UsageModel){
        return usage ;
      }
      return UsageModel(
          completionTokens: usage.completionTokens,
          promptTokens: usage.promptTokens,
          totalTokens: usage.totalTokens);
    }

  Map<String , dynamic> toJson() => {
    "completion_tokens" : completionTokens ,
    "prompt_tokens" : promptTokens,
    "total_tokens" : totalTokens
  };
}